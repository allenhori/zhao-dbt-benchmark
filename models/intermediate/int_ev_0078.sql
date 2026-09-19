select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    coalesce(p.v1, 0) + 2 as v1,
    p.v4 + 11 as v2,
    p.v1 * 7 as v3,
    coalesce(p.v1, 0) + 7 as v4,
    coalesce(p.v2, 0) + 7 as v5,
    round(p.v1 / 5.0, 4) as v6
from {{ ref('int_ev_0004') }} as p
