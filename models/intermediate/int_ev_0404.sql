select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    p.v4 * 2 as v1,
    p.v2 - p.v1 as v2,
    round(p.v1 / 13.0, 4) as v3,
    round(p.v1 / 3.0, 4) as v4,
    p.v2 * 0.5 + p.v1 * 0.5 as v5,
    coalesce(p.v4, 0) + 7 as v6
from {{ ref('int_ev_0003') }} as p
