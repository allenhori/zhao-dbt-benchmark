select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    coalesce(p.v2, 0) + 13 as v1,
    p.v8 * 0.5 + p.v2 * 0.5 as v2,
    p.v8 * 2 as v3,
    p.v3 * 0.5 + p.v2 * 0.5 as v4,
    round(p.v8 / 3.0, 4) as v5,
    round(p.v3 / 2.0, 4) as v6,
    round(p.v2 / 11.0, 4) as v7,
    coalesce(p.v2, 0) + 11 as v8
from {{ ref('int_ev_0023') }} as p
