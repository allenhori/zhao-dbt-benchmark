select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    p.v4 + 5 as v1,
    p.v2 + p.v1 as v2,
    p.v4 * 3 as v3,
    p.v4 - p.v2 as v4,
    p.v4 - p.v1 as v5,
    p.v1 + p.v2 as v6
from {{ ref('int_ev_0040') }} as p
