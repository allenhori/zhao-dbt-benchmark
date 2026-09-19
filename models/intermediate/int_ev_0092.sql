select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    p.v2 * 0.5 + p.v7 * 0.5 as v1,
    p.v2 * 5 as v2,
    p.v8 * 2 as v3,
    p.v2 * 0.5 + p.v8 * 0.5 as v4,
    p.v2 * 5 as v5,
    p.v2 + 2 as v6
from {{ ref('int_ev_0067') }} as p
