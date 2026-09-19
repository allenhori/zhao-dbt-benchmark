select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    p.v1 + p.v8 as v1,
    round(p.v3 / 3.0, 4) as v2,
    p.v1 + 3 as v3,
    p.v8 + 7 as v4,
    p.v1 * 0.5 + p.v3 * 0.5 as v5,
    p.v8 + p.v1 as v6,
    coalesce(p.v3, 0) + 2 as v7,
    p.v1 - p.v8 as v8
from {{ ref('int_ev_0000') }} as p
