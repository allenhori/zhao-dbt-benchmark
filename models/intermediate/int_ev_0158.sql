select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    case when p.v3 > 500 then p.v3 else 0 end as v1,
    p.v4 * 11 as v2,
    case when p.v4 > 1300 then p.v4 else 0 end as v3,
    p.v4 + 2 as v4,
    case when p.v4 > 500 then p.v4 else 0 end as v5,
    case when p.v4 > p.v3 then p.v4 else p.v3 end as v6,
    p.v4 + p.v3 as v7
from {{ ref('int_ev_0151') }} as p
