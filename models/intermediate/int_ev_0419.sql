select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    round(p.v3 / 7.0, 4) as v1,
    p.v6 + 3 as v2,
    case when p.v6 > p.v3 then p.v6 else p.v3 end as v3,
    case when p.v3 > 500 then p.v3 else 0 end as v4,
    case when p.v3 > 700 then p.v3 else 0 end as v5,
    case when p.v4 > p.v6 then p.v4 else p.v6 end as v6,
    case when p.v4 > 500 then p.v4 else 0 end as v7
from {{ ref('int_ev_0026') }} as p
