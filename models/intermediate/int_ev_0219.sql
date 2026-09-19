select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    case when p.v6 > 1300 then p.v6 else 0 end as v1,
    p.v5 + p.v3 as v2,
    p.v3 * 0.5 + p.v5 * 0.5 as v3,
    p.v3 * 0.5 + p.v5 * 0.5 as v4,
    p.v5 + 11 as v5,
    p.v3 + 7 as v6,
    p.v5 + 2 as v7,
    case when p.v3 > 700 then p.v3 else 0 end as v8
from {{ ref('int_ev_0199') }} as p
