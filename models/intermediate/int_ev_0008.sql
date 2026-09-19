select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    round(p.v2 / 13.0, 4) as v1,
    p.v2 * 2 as v2,
    p.v2 * 11 as v3,
    round(p.v3 / 11.0, 4) as v4,
    p.v3 + 2 as v5,
    p.v2 - p.v6 as v6
from {{ ref('int_ev_0005') }} as p
