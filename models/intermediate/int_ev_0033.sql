select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    round(p.v1 / 13.0, 4) as v1,
    p.v3 * 3 as v2,
    p.v1 + p.v3 as v3,
    p.v3 + 3 as v4,
    p.v3 * 0.5 + p.v1 * 0.5 as v5,
    coalesce(p.v3, 0) + 3 as v6,
    p.v3 * 0.5 + p.v1 * 0.5 as v7,
    p.v1 * 2 as v8
from {{ ref('int_ev_0005') }} as p
