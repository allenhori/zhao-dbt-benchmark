select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    round(p.v4 / 3.0, 4) as v1,
    round(p.v4 / 2.0, 4) as v2,
    coalesce(p.v3, 0) + 3 as v3,
    p.v3 + 13 as v4,
    p.v4 + p.v7 as v5,
    p.v4 * 0.5 + p.v3 * 0.5 as v6,
    round(p.v4 / 3.0, 4) as v7,
    round(p.v4 / 5.0, 4) as v8
from {{ ref('int_ev_0023') }} as p
