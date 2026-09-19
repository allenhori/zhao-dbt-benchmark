select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    p.v3 + p.v5 as v1,
    p.v3 + p.v5 as v2,
    p.v3 * 13 as v3,
    p.v3 + 3 as v4,
    p.v3 + 2 as v5,
    p.v5 + p.v3 as v6,
    case when p.v3 > 500 then p.v3 else 0 end as v7,
    p.v5 * 2 as v8
from {{ ref('int_ev_0008') }} as p
