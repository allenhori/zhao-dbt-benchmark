select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    case when p.v5 > p.v1 then p.v5 else p.v1 end as v1,
    p.v6 - p.v1 as v2,
    p.v5 + 3 as v3,
    p.v6 * 0.5 + p.v5 * 0.5 as v4,
    p.v1 - p.v5 as v5,
    case when p.v5 > p.v6 then p.v5 else p.v6 end as v6,
    p.v6 + 3 as v7
from {{ ref('int_ev_0026') }} as p
