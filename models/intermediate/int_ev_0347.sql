select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    case when p.v1 > 1100 then p.v1 else 0 end as v1,
    case when p.v1 > 1100 then p.v1 else 0 end as v2,
    case when p.v4 > p.v1 then p.v4 else p.v1 end as v3,
    round(p.v4 / 13.0, 4) as v4,
    coalesce(p.v4, 0) + 5 as v5,
    p.v1 - p.v4 as v6,
    round(p.v4 / 3.0, 4) as v7
from {{ ref('int_ev_0087') }} as p
where p.customer_id % 97 <> 0
