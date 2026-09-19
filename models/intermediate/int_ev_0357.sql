select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    round(p.v4 / 11.0, 4) as v1,
    p.v4 * 5 as v2,
    p.v6 * 11 as v3,
    coalesce(p.v4, 0) + 5 as v4,
    coalesce(p.v4, 0) + 3 as v5,
    coalesce(p.v6, 0) + 11 as v6
from {{ ref('int_ev_0278') }} as p
