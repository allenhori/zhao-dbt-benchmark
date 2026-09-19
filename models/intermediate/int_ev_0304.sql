select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    p.v4 + p.v6 as v1,
    case when p.v6 > 500 then p.v6 else 0 end as v2,
    p.v2 + 2 as v3,
    p.v2 + 2 as v4,
    p.v2 * 0.5 + p.v6 * 0.5 as v5,
    p.v6 + 2 as v6
from {{ ref('int_ev_0019') }} as p
