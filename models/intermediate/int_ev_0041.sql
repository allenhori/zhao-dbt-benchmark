select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    p.v6 - p.v3 as v1,
    coalesce(p.v6, 0) + 5 as v2,
    p.v7 * 7 as v3,
    p.v7 * 5 as v4,
    coalesce(p.v3, 0) + 2 as v5,
    coalesce(p.v3, 0) + 7 as v6
from {{ ref('int_ev_0030') }} as p
