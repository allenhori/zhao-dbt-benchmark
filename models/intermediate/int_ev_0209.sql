select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    case when p.v1 > 1300 then p.v1 else 0 end as v1,
    p.v1 * 0.5 + p.v6 * 0.5 as v2,
    p.v1 * 11 as v3,
    case when p.v4 > p.v6 then p.v4 else p.v6 end as v4,
    p.v6 + 13 as v5,
    p.v6 - p.v1 as v6
from {{ ref('int_ev_0096') }} as p
