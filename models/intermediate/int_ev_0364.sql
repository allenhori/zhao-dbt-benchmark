select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    p.v4 * 0.5 + p.v5 * 0.5 as v1,
    p.v5 + 13 as v2,
    p.v4 + p.v5 as v3,
    p.v5 * 0.5 + p.v4 * 0.5 as v4,
    coalesce(p.v5, 0) + 13 as v5,
    coalesce(p.v4, 0) + 13 as v6
from {{ ref('int_ev_0003') }} as p
