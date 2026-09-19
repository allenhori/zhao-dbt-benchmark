select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    case when p.v1 > 300 then p.v1 else 0 end as v1,
    p.v2 * 7 as v2,
    p.v2 - p.v7 as v3,
    case when p.v2 > 300 then p.v2 else 0 end as v4,
    p.v2 + 3 as v5,
    p.v1 + 3 as v6
from {{ ref('int_ev_0028') }} as p
