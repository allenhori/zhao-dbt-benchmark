select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    p.v3 - p.v6 as v1,
    p.v3 + 5 as v2,
    coalesce(p.v6, 0) + 7 as v3,
    p.v3 * 0.5 + p.v6 * 0.5 as v4,
    p.v6 + 7 as v5,
    p.v6 * 3 as v6,
    coalesce(p.v3, 0) + 2 as v7,
    p.v6 + 11 as v8
from {{ ref('int_ev_0001') }} as p
