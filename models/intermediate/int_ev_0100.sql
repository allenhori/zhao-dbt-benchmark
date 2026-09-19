select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    p.v6 + 11 as v1,
    case when p.v1 > 1100 then p.v1 else 0 end as v2,
    case when p.v6 > 300 then p.v6 else 0 end as v3,
    p.v6 * 0.5 + p.v1 * 0.5 as v4,
    p.v1 + 7 as v5,
    p.v1 + 3 as v6,
    case when p.v1 > 1300 then p.v1 else 0 end as v7
from {{ ref('int_ev_0069') }} as p
where p.customer_id % 97 <> 0
