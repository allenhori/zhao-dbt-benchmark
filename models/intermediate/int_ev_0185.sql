select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    p.v5 + p.v1 as v1,
    p.v1 * 7 as v2,
    coalesce(p.v1, 0) + 2 as v3,
    p.v5 + 7 as v4,
    p.v5 * 3 as v5,
    p.v5 + 5 as v6,
    coalesce(p.v1, 0) + 13 as v7
from {{ ref('int_ev_0020') }} as p
