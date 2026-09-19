select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    p.v1 + 2 as v1,
    case when p.v3 > p.v5 then p.v3 else p.v5 end as v2,
    p.v1 - p.v3 as v3,
    p.v3 + 2 as v4,
    p.v5 + 2 as v5,
    p.v3 + p.v5 as v6,
    case when p.v5 > 200 then p.v5 else 0 end as v7
from {{ ref('int_ev_0083') }} as p
