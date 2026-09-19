select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    p.v1 - p.v5 as v1,
    p.v5 * 2 as v2,
    p.v5 + p.v1 as v3,
    coalesce(p.v5, 0) + 7 as v4,
    case when p.v1 > 1100 then p.v1 else 0 end as v5,
    coalesce(p.v1, 0) + 2 as v6,
    p.v5 + p.v1 as v7
from {{ ref('int_ev_0007') }} as p
