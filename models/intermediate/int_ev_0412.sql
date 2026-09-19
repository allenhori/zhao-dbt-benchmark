select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    p.v2 - p.v7 as v1,
    p.v2 + 5 as v2,
    p.v2 * 5 as v3,
    coalesce(p.v7, 0) + 5 as v4,
    p.v7 + 13 as v5,
    p.v7 + 11 as v6
from {{ ref('int_ev_0302') }} as p
