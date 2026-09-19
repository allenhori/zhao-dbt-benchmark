select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    case when p.v5 > p.v3 then p.v5 else p.v3 end as v1,
    case when p.v5 > 700 then p.v5 else 0 end as v2,
    case when p.v3 > 200 then p.v3 else 0 end as v3,
    coalesce(p.v5, 0) + 2 as v4,
    p.v3 * 2 as v5,
    p.v3 * 7 as v6
from {{ ref('int_ev_0014') }} as p
