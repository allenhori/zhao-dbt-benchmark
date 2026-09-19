select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    p.v3 * 11 as v1,
    p.v3 * 5 as v2,
    p.v1 - p.v3 as v3,
    p.v3 * 3 as v4,
    case when p.v1 > p.v3 then p.v1 else p.v3 end as v5,
    case when p.v1 > 200 then p.v1 else 0 end as v6
from {{ ref('int_ev_0024') }} as p
