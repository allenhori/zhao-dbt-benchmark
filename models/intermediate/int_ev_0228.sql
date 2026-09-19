select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    coalesce(p.v6, 0) + 2 as v1,
    p.v1 - p.v6 as v2,
    round(p.v8 / 2.0, 4) as v3,
    round(p.v1 / 5.0, 4) as v4,
    p.v1 * 0.5 + p.v8 * 0.5 as v5,
    round(p.v6 / 5.0, 4) as v6
from {{ ref('int_ev_0023') }} as p
