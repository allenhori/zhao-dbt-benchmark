select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    coalesce(p.v6, 0) + 13 as v1,
    p.v6 - p.v1 as v2,
    coalesce(p.v6, 0) + 5 as v3,
    p.v1 + p.v6 as v4,
    p.v2 * 5 as v5,
    round(p.v6 / 3.0, 4) as v6,
    case when p.v6 > 1100 then p.v6 else 0 end as v7
from {{ ref('int_ev_0008') }} as p
where p.customer_id % 97 <> 0
