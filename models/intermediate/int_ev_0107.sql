select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    coalesce(p.v3, 0) + 13 as v1,
    case when p.v5 > 200 then p.v5 else 0 end as v2,
    case when p.v3 > 1300 then p.v3 else 0 end as v3,
    p.v5 * 0.5 + p.v3 * 0.5 as v4,
    case when p.v3 > 500 then p.v3 else 0 end as v5,
    p.v5 + 7 as v6,
    p.v6 * 3 as v7
from {{ ref('int_ev_0034') }} as p
