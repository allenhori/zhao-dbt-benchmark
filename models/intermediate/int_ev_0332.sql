select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    p.v6 * 3 as v1,
    p.v6 - p.v7 as v2,
    p.v2 * 3 as v3,
    p.v6 * 5 as v4,
    coalesce(p.v6, 0) + 5 as v5,
    p.v6 - p.v2 as v6
from {{ ref('int_ev_0009') }} as p
