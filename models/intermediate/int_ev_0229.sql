select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    case when p.v7 > 1100 then p.v7 else 0 end as v1,
    coalesce(p.v7, 0) + 7 as v2,
    case when p.v2 > 1100 then p.v2 else 0 end as v3,
    round(p.v7 / 3.0, 4) as v4,
    coalesce(p.v2, 0) + 13 as v5,
    round(p.v7 / 7.0, 4) as v6,
    p.v1 - p.v7 as v7
from {{ ref('int_ev_0024') }} as p
where p.customer_id % 97 <> 0
