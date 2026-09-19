select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    p.v3 - p.v2 as v1,
    p.v3 + 11 as v2,
    coalesce(p.v2, 0) + 13 as v3,
    p.v3 * 11 as v4,
    coalesce(p.v2, 0) + 7 as v5,
    p.v2 + p.v3 as v6,
    round(p.v2 / 2.0, 4) as v7,
    p.v2 * 3 as v8
from {{ ref('int_ev_0034') }} as p
