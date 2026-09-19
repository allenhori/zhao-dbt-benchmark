select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    p.v3 * 11 as v1,
    case when p.v2 > 1100 then p.v2 else 0 end as v2,
    p.v3 + 13 as v3,
    p.v2 - p.v3 as v4,
    coalesce(p.v3, 0) + 7 as v5,
    p.v2 + 5 as v6,
    p.v3 * 0.5 + p.v2 * 0.5 as v7
from {{ ref('int_ev_0008') }} as p
