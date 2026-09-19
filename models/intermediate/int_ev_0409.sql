select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    case when p.v6 > 300 then p.v6 else 0 end as v1,
    case when p.v8 > p.v6 then p.v8 else p.v6 end as v2,
    p.v5 + 5 as v3,
    case when p.v5 > p.v6 then p.v5 else p.v6 end as v4,
    p.v6 * 5 as v5,
    p.v6 * 3 as v6,
    p.v6 + 11 as v7
from {{ ref('int_ev_0293') }} as p
