select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    case when p.v6 > 200 then p.v6 else 0 end as v1,
    case when p.v6 > 700 then p.v6 else 0 end as v2,
    case when p.v1 > 1100 then p.v1 else 0 end as v3,
    p.v6 * 5 as v4,
    p.v3 + 5 as v5,
    case when p.v6 > 1100 then p.v6 else 0 end as v6,
    p.v1 - p.v6 as v7
from {{ ref('int_ev_0171') }} as p
