select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    p.v7 + 2 as v1,
    p.v7 - p.v5 as v2,
    p.v7 * 11 as v3,
    p.v7 * 5 as v4,
    p.v5 + 5 as v5,
    p.v7 + 2 as v6,
    round(p.v5 / 13.0, 4) as v7
from {{ ref('int_ev_0028') }} as p
