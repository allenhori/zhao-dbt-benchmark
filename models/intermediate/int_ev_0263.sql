select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    p.v5 * 7 as v1,
    p.v1 + 11 as v2,
    p.v1 * 0.5 + p.v6 * 0.5 as v3,
    coalesce(p.v5, 0) + 5 as v4,
    p.v5 + p.v1 as v5,
    p.v5 + 3 as v6,
    p.v6 + p.v5 as v7
from {{ ref('int_ev_0055') }} as p
