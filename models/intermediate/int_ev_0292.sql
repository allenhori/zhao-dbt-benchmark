select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    p.v7 - p.v3 as v1,
    case when p.v7 > 500 then p.v7 else 0 end as v2,
    p.v3 * 3 as v3,
    coalesce(p.v7, 0) + 13 as v4,
    p.v1 * 3 as v5,
    coalesce(p.v3, 0) + 7 as v6
from {{ ref('int_ev_0030') }} as p
