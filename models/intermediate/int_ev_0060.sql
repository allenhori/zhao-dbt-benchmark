select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    coalesce(p.v3, 0) + 2 as v1,
    p.v3 * 13 as v2,
    p.v3 * 3 as v3,
    round(p.v6 / 3.0, 4) as v4,
    p.v3 - p.v6 as v5,
    coalesce(p.v6, 0) + 13 as v6,
    coalesce(p.v6, 0) + 3 as v7
from {{ ref('int_ev_0056') }} as p
