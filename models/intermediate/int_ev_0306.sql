select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    p.v3 + 7 as v1,
    coalesce(p.v4, 0) + 5 as v2,
    case when p.v2 > p.v3 then p.v2 else p.v3 end as v3,
    case when p.v4 > p.v3 then p.v4 else p.v3 end as v4,
    p.v4 + 2 as v5,
    round(p.v3 / 3.0, 4) as v6,
    p.v4 - p.v2 as v7
from {{ ref('int_ev_0188') }} as p
where p.customer_id % 97 <> 0
