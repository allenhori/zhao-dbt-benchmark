select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    p.v5 + p.v4 as v1,
    case when p.v5 > 300 then p.v5 else 0 end as v2,
    p.v4 * 0.5 + p.v5 * 0.5 as v3,
    p.v5 + 5 as v4,
    p.v4 - p.v5 as v5,
    p.v5 + 13 as v6,
    p.v5 + 5 as v7
from {{ ref('int_ev_0010') }} as p
