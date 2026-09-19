select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    p.v4 + p.v2 as v1,
    case when p.v5 > 1300 then p.v5 else 0 end as v2,
    p.v2 * 0.5 + p.v5 * 0.5 as v3,
    coalesce(p.v2, 0) + 7 as v4,
    case when p.v2 > 200 then p.v2 else 0 end as v5,
    p.v4 * 3 as v6,
    case when p.v5 > 300 then p.v5 else 0 end as v7
from {{ ref('int_ev_0003') }} as p
