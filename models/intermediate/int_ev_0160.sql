select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    coalesce(p.v2, 0) + 5 as v1,
    p.v7 * 3 as v2,
    p.v2 + p.v7 as v3,
    coalesce(p.v2, 0) + 13 as v4,
    p.v7 + p.v2 as v5,
    p.v2 + 3 as v6
from {{ ref('int_ev_0023') }} as p
