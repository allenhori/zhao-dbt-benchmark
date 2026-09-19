select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    case when p.v4 > 700 then p.v4 else 0 end as v1,
    p.v6 * 11 as v2,
    p.v1 - p.v4 as v3,
    p.v1 * 5 as v4,
    p.v1 * 0.5 + p.v6 * 0.5 as v5,
    p.v1 * 2 as v6
from {{ ref('int_ev_0075') }} as p
