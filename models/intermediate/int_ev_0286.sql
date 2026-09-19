select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    p.v1 * 2 as v1,
    p.v2 + p.v1 as v2,
    p.v1 + p.v2 as v3,
    round(p.v2 / 3.0, 4) as v4,
    p.v1 + p.v2 as v5,
    p.v1 * 0.5 + p.v2 * 0.5 as v6,
    round(p.v2 / 5.0, 4) as v7,
    round(p.v2 / 2.0, 4) as v8
from {{ ref('int_ev_0075') }} as p
