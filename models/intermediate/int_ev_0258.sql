select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    round(p.v6 / 7.0, 4) as v1,
    case when p.v6 > 200 then p.v6 else 0 end as v2,
    case when p.v4 > 200 then p.v4 else 0 end as v3,
    p.v6 - p.v7 as v4,
    case when p.v6 > 1300 then p.v6 else 0 end as v5,
    p.v6 * 13 as v6,
    p.v6 + 7 as v7
from {{ ref('int_ev_0025') }} as p
