select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    coalesce(p.v4, 0) + 13 as v1,
    round(p.v5 / 13.0, 4) as v2,
    p.v5 - p.v4 as v3,
    case when p.v2 > p.v5 then p.v2 else p.v5 end as v4,
    p.v5 + p.v2 as v5,
    case when p.v4 > 700 then p.v4 else 0 end as v6,
    round(p.v2 / 5.0, 4) as v7,
    coalesce(p.v4, 0) + 11 as v8
from {{ ref('int_ev_0015') }} as p
where p.customer_id % 97 <> 0
