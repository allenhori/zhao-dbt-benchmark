select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    case when p.v3 > 300 then p.v3 else 0 end as v1,
    p.v6 - p.v7 as v2,
    p.v6 - p.v3 as v3,
    case when p.v3 > 300 then p.v3 else 0 end as v4,
    case when p.v7 > 1300 then p.v7 else 0 end as v5,
    case when p.v3 > p.v6 then p.v3 else p.v6 end as v6,
    case when p.v6 > 500 then p.v6 else 0 end as v7,
    round(p.v3 / 13.0, 4) as v8
from {{ ref('int_ev_0203') }} as p
