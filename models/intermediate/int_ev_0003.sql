select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    p.v3 * 0.5 + p.v4 * 0.5 as v1,
    round(p.v4 / 13.0, 4) as v2,
    p.v4 + 3 as v3,
    coalesce(p.v3, 0) + 11 as v4,
    p.v2 * 7 as v5,
    p.v2 + 5 as v6
from {{ ref('int_ev_0000') }} as p
