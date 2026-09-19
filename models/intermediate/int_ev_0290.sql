select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    case when p.v7 > p.v1 then p.v7 else p.v1 end as v1,
    round(p.v1 / 13.0, 4) as v2,
    case when p.v7 > 500 then p.v7 else 0 end as v3,
    p.v1 + p.v7 as v4,
    coalesce(p.v1, 0) + 3 as v5,
    case when p.v1 > p.v7 then p.v1 else p.v7 end as v6,
    round(p.v7 / 11.0, 4) as v7,
    round(p.v1 / 3.0, 4) as v8
from {{ ref('int_ev_0015') }} as p
where p.customer_id % 97 <> 0
