select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    round(p.v3 / 2.0, 4) as v1,
    coalesce(p.v3, 0) + 3 as v2,
    p.v3 * 0.5 + p.v6 * 0.5 as v3,
    p.v6 + p.v3 as v4,
    round(p.v4 / 5.0, 4) as v5,
    p.v4 * 13 as v6
from {{ ref('int_ev_0005') }} as p
