select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    p.v2 - p.v4 as v1,
    p.v2 * 0.5 + p.v4 * 0.5 as v2,
    coalesce(p.v4, 0) + 13 as v3,
    case when p.v4 > 300 then p.v4 else 0 end as v4,
    p.v2 + 5 as v5,
    p.v2 * 2 as v6,
    coalesce(p.v2, 0) + 7 as v7
from {{ ref('int_ev_0236') }} as p
