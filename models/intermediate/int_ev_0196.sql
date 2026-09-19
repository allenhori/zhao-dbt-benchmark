select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    p.v3 * 13 as v1,
    p.v2 * 0.5 + p.v4 * 0.5 as v2,
    p.v4 + p.v2 as v3,
    p.v4 * 2 as v4,
    p.v2 * 7 as v5,
    case when p.v2 > p.v4 then p.v2 else p.v4 end as v6
from {{ ref('int_ev_0137') }} as p
