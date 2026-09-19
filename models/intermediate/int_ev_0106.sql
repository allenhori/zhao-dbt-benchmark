select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    p.v5 - p.v3 as v1,
    coalesce(p.v5, 0) + 13 as v2,
    round(p.v5 / 13.0, 4) as v3,
    coalesce(p.v5, 0) + 3 as v4,
    p.v3 * 0.5 + p.v5 * 0.5 as v5,
    p.v5 - p.v3 as v6,
    p.v5 * 0.5 + p.v4 * 0.5 as v7
from {{ ref('int_ev_0084') }} as p
